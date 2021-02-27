require 'swagger_helper'


describe 'Tasks API' do
  
  path '/v1/tasks' do
    
    post 'Creates a Task' do
      tags 'Post Task'
      consumes 'application/json'
      produces 'application/json'
      
      parameter name: :task, in: :body, schema: {
        type: :object, 
        properties:{
              name: {type: :string},
              desc: {type: :string},
              calendar_id: {type: :number},
              start: {type: :number},
              end: {type: :number}
              
          }, 
          required: ['name', 'desc', 'calendar_id', 'start', 'end']
          }  
      
      produces "application/json"

      response '201', 'task created' do
        schema type: :object,
        properties: {
          task:{
            type: :object,
            properties: {
              id:{type: :integer},
              name: {type: :string},
              desc: {type: :string},
              calendar_id: {type: :number},
              start: {type: :number},
              end: {type: :number}            
            }
          }
       }
        let(:task) { { task: {name: "New Task", desc: "this task", calendar_id: 1, start: 8, end:22}} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:task) { {message: 'invalid'} }
        run_test!
      end
    end
  end

  path '/v1/tasks/{id}' do
    
    patch 'Edits a Task' do
      tags 'Edits a Task by id'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :string 
      parameter name: :task, in: :body, :type => :object,
      schema: {
        type: :object,
        properties:{
          name: {type: :string},
          desc: {type: :string},
          calendar_id: {type: :number},
          start: {type: :number},
          end: {type: :number}
        },
        required: [ 'id']
      }
      
      response '204', 'calendar updated sucessfully!' do
        schema type: :object,
        properties: {
          name: {type: :string},
          desc: {type: :string},
          calendar_id: {type: :number},
          start: {type: :number},
          end: {type: :number}
        }
        let(:id) {Task.update(name: "New Task", desc: "this task", calendar_id: 1, start: 8, end:22).id}
        run_test!
      
      end

    end

  end

end