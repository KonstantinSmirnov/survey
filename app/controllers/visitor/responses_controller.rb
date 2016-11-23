class Visitor::ResponsesController < VisitorController
  protect_from_forgery with: :null_session
  
  def create
    params.except(:action, :controller).each do |key, value|
      question_id = key.split('-').last
      question = Question.find(question_id)
      case question.question_type
      when "single"
        answer_variant_id = value.split('-').last
        response = Response.create(question_id: question_id, answer_variant_id: answer_variant_id)
      when "multiply"
        value.each do |inner_value|
          answer_variant_id = inner_value.split('-').last
          response = Response.create(question_id: question_id, answer_variant_id: answer_variant_id)
        end
      when "text"
        answer_variant_id = question.answer_variants.first.id
        question_id = question.id
        text = value
        response = Response.create(question_id: question_id, answer_variant_id: answer_variant_id, text: text)
      end
    end
  end

end
