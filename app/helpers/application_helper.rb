module ApplicationHelper
  def display_error_messages(model,attribute)
    @error = nil
    # インスタンスの中身を一旦削除
    # 削除しないと2回目呼ばれたときに、インスタンスの中身を
    # そのまま使用してしまい、違うフォームで別のエラーメッセージが
    # 出力されてしまう。
    model.errors.full_messages_for(attribute).each do |error|
      @error = error
    end
    @error
  end
end
