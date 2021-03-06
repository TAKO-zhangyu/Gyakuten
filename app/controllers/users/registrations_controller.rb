# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    build_resource(sign_up_params)
    if Rails.env.production?
      # SlackAPIで入力された Slack メンバー ID が存在し，削除済みでないかを確認
      # 問題がない場合は自動で承認済み扱いとする
      Rails.application.credentials.dig(:slack, :oauth_token).keys.each do |slack_name|
        client = AutoSlackApproval.new(slack_name: slack_name, slack_id: resource.slack_id)
        resource.flag = client.approval?
        if resource.flag
          resource.slack_name = slack_name.to_s
          break
        end
      end
    else
      # 本番環境以外では任意の Slack_id を受け付ける
      resource.flag = true
    end
    if resource.flag
      # 以下は元ソース通り
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
        # 以下は元ソース通り
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    else
      # 問題がある場合の対処
      flash[:alert] = "入力された Slack メンバー ID は存在しません"
      render :new
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
