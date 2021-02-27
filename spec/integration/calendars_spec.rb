require 'swagger_helper'


describe 'Calendars API' do
  
  path '/v1/calendars' do
    
    post 'Creates a Calendar' do
      tags 'Add a Calendar'
      consumes 'application/json'
      produces 'application/json'
      
      parameter name: :calendar, in: :body, schema: {
        type: :object, 
        properties:{
              name: {type: :string},
              user_id: {type: :number},
              wake_hour: {type: :number},
              sleep_hour: {type: :number}
              
          }, 
          required: ['name', 'user_id', 'wake_hour', 'sleep_hour']
          }  
      
      produces "application/json"

      response '201', 'calendar created' do
        schema type: :object,
        properties: {
          calendar:{
            type: :object,
            properties: {
              id:{type: :integer},
              name: {type: :string},
              user_id: {type: :number},
              wake_hour: {type: :number},
              sleep_hour: {type: :number}            
            }
          }
       }
        let(:calendar) { { calendar: {name: "Mike's Calendar", user_id: 1, wake_hour: 8, sleep_hour:22}} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:calendar) { {message: 'invalid'} }
        run_test!
      end
    end
  end

  path '/v1/calendars{id}' do
    get 'retrieves a calendar and tasks' do
      tags 'Gets a Calendar by id'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string
      
      response '200', 'calendar found!' do
        schema type: :object,
          properties:{
                                  
              id: {type: :integer},
              name: {type: :string},
              user_id: {type: :number},
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
            
          },
        
        required: [ 'id']

        let(:id) {Calendar.create(name: "Mike's Calendar", user_id: 1, wake_hour: 8, sleep_hour:22).id}
        run_test!
      end
      response '404', 'User not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
    patch 'edits a calendar' do
      tags 'Edits a Calendar by id'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :string 
      parameter name: :calendar, in: :body, :type => :object,
      schema: {
        type: :object,
        properties:{
          name: {type: :string},
          user_id: {type: :number},
          wake_hour: {type: :number},
          sleep_hour: {type: :number}
        },
        required: [ 'id']
      }
      
      response '204', 'calendar updated sucessfully!' do
        schema type: :object,
        properties: {
          name: {type: :string},
          user_id: {type: :number},
          wake_hour: {type: :number},
          sleep_hour: {type: :number}
        }
        let(:id) {Calendar.update(name: "Mike's Calendar", user_id: 1, wake_hour: 8, sleep_hour:22).id}
        run_test!
      
      end

    end

  end

end