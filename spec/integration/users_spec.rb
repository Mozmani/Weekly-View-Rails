require 'swagger_helper'


describe 'Users API' do
  
  path '/v1/users' do
    
    post 'Creates a user' do
      tags 'Add a User'
      consumes 'application/json'
      produces 'application/json'
      
      parameter name: :user, in: :body, schema: {
        type: :object, 
        properties:{
          user:{
            type: :object,
            properties: {
              first_name: {type: :string},
              last_name: {type: :string},
              email: {type: :string},
              password: {type: :string},
              password_confirmation: {type: :string}
            
            
          }, 
          required: ['first_name', 'last_name', 'email', 'password', 'password_confirmation']
          }
        }
        
      }
      produces "application/json"

      response '201', 'user created' do
        schema type: :object,
        properties: {
          user:{
            type: :object,
            properties: {
              id:{type: :integer},
              first_name: {type: :string},
              last_name: {type: :string},
              email: {type: :string}
              
            }
          }
       }
        let(:user) { { user: {first_name: 'Mike', last_name: 'Jones', email: 'mrJones@gmail.com', password: '123456', password_confirmation: '123456'}} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { {first_name: 'foo'} }
        run_test!
      end
    end
  end

  path '/v1/users{id}' do
    get 'retrieves a user' do
      tags ' Get a User by id'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string
      
      response '200', 'name found!' do
        schema type: :object,
        properties: {
          id: {type: :integer},
          first_name: {type: :string},
          calendars:{
            type: :object,
            properties:{
              id: {type: :integer},
              name: {type: :string},
              wake_hour: {type: :number},
              sleep_hour: {type: :number},
              tasks: {type: :object,
                properties:{
                  name: {type: :string},
                  desc: {type: :string},
                  start: {type: :number},
                  end: {type: :number}
                }
              
              }
            }
          }
        },
        required: [ 'id']

        let(:id) {User.create(first_name: 'Tom', last_name: 'Hanks', email: 'TMOney@thanks.com', password:'123456' , password_confirmation: '123456').id}
        run_test!
      end
      response '404', 'User not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

end