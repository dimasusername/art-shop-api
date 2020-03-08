# frozen_string_literal: true

class PaintingsController < App
  prefix(:paintings)
  get do
    present(Painting.all, with: PaintingsRepresenter)
  end

  desc('Create a painting')
  params do
    requires(:name, type: String)
    requires(
      :price,
      type: Integer,
      coerce_with: ->(val) { val.positive? && val }
    )
  end
  post do
    painting = Painting.create!(declared(params, **DECLARED_OPTIONS))
  rescue Mongoid::Errors::Validations => e
    error!(
      {
        error: e.problem,
        summary: e.summary,
        resolution: e.resolution
      },
      400
    )
  else
    present(painting, with: PaintingRepresenter)
  end

  resource '/:id' do
    painting = nil

    before do
      painting = Painting.find(params[:id].to_s)
    rescue Mongoid::Errors::DocumentNotFound => e
      error!(
        {
          error: e.problem
        },
        404
      )
    end

    get do
      present(painting, with: PaintingRepresenter)
    end

    delete do
      status(204)
      painting.destroy
      nil
    end
  end
end
