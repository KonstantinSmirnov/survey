class Response::ResponsesController < ResponseController
  protect_from_forgery with: :null_session
  
  def create
    params.except(:action, :controller).each do |key, value|
      question_id = key.partition('-').last
      question = Question.find(question_id)
      case question.question_type
      when "single"
        p value
      end
    end
  end
end
