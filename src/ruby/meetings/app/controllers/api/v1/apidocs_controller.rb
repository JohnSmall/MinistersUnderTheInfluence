class Api::V1::ApidocsController < ApplicationController
  include Swagger::Blocks

  def self.get_deployment_host
    deploy_yml = 'config/deploy.yml'
    return nil unless File.exist? deploy_yml
    yaml = File.read(deploy_yml)
    deploy = YAML.load(yaml)
    section = deploy[Rails.env.to_sym]
    section ? section[:domain] : nil
  end

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Swagger Ministers Under the Influence'
      key :description, 'API for Ministers Under the Influence ' \
        'Install the Chrome Swagger extension and point it at this json'
      contact do
        key :name, 'Hack Brexit API Team'
      end
      license do
        key :name, 'MIT'
      end
    end
    %w(person organisation government-office meeting hospitality travel gift source-file influence-organisation-person influence-government-office-person).each do | tag_name |
      tag do
      key :name, tag_name
      key :description, "#{tag_name.classify} operations"
      externalDocs do
        key :description, 'See the JSON-API documentation'
        key :url, 'http://jsonapi.org/'
      end
    end
    end

    key :host, Api::V1::ApidocsController::get_deployment_host || 'example.com'
    key :basePath, '/api/v1'
    key :consumes, ['application/vnd.api+json']
    key :produces, ['application/vnd.api+json']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    Api::V1::PeopleController,
    Api::V1::PersonResource,
    Api::V1::OrganisationResource,
    Api::V1::OrganisationsController,
    Api::V1::GovernmentOfficeResource,
    Api::V1::GovernmentOfficesController,
    Api::V1::MeetingResource,
    Api::V1::MeetingsController,
    Api::V1::HospitalityResource,
    Api::V1::HospitalitiesController,
    Api::V1::TravelResource,
    Api::V1::TravelsController,
    Api::V1::GiftResource,
    Api::V1::GiftsController,
    Api::V1::SourceFileResource,
    Api::V1::SourceFilesController,
    Api::V1::InfluenceOrganisationPersonResource,
    Api::V1::InfluenceOrganisationPeopleController,
    Api::V1::InfluenceGovernmentOfficePersonResource,
    Api::V1::InfluenceGovernmentOfficePeopleController,
    ErrorModel,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end

  def show
  end
end
