module Rounds
  module Items
    class TargetedSerializer < ActiveModel::Serializer
      attributes :row, :column, :target_type, :targeted

      def targeted
        return if object.targeted_by.blank?
        Hash[
          my_point: object.targeted_by.session_id == session_id
        ]
      end

      private

      def session_id
        instance_options[:serializer_params][:session_id]
      end
    end
  end
end
