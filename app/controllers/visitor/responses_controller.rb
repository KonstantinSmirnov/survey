class Visitor::ResponsesController < VisitorController
  protect_from_forgery with: :null_session

  def create

    unless params.except(:action, :controller).blank?

      first_question_id = params.except(:action, :controller).first[0].split('-').last
      first_question = Question.find(first_question_id)

      respondent = Respondent.create(survey: first_question.survey)

      params.except(:action, :controller).each do |key, value|
        question_id = key.split('-').last
        question = Question.find(question_id)
        case question.question_type
        when "single"
          answer_variant_id = value.split('-').last
          response = Response.create(question_id: question_id, answer_variant_id: answer_variant_id, respondent: respondent)
        when "multiply"
          value.each do |inner_value|
            answer_variant_id = inner_value.split('-').last
            response = Response.create(question_id: question_id, answer_variant_id: answer_variant_id, respondent: respondent)
          end
        when "text"
          unless value.blank?
            answer_variant_id = question.answer_variants.first.id
            question_id = question.id
            text = value
            response = Response.create(question_id: question_id, answer_variant_id: answer_variant_id, respondent: respondent, text: text)
          end
        when "scale"
          selected_point = value.split('-')[-1]
          answer_variant_id = value.split('-')[-2]
          response = Response.create(question_id: question_id, answer_variant_id: answer_variant_id, respondent: respondent, selected_point: selected_point)
        end
      end

    end

    redirect_to responses_path
  end

  def index

  end

end
