# frozen_string_literal: true

class PoliciesController < ApplicationController
  def index
    render plain: 'Policy List'
  end
end
