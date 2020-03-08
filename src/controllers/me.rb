# frozen_string_literal: true

class MeController < App
  prefix(:me)

  me = nil
  before do
    if Customer.all.count.zero?
      error!({ error: 'Create customers first' }, 500)
    else
      me = Customer.first
    end
  end

  get do
    present(me, with: MeRepresenter)
  end

  resource '/purchases' do
    get do
      present(me.purchases.includes(:painting), with: MyPurchasesRepresenter)
    end

    get '/:id' do
      present(me.purchases.find(params['id']), with: MyPurchaseRepresenter)
    end

    delete do
      me.purchases.delete_all
    end

    desc('Make a purchase')
    params do
      requires(:painting, type: Painting, message: 'what are you buying?')
    end
    post do
      new_balance = me.balance - params[:painting].price
      if new_balance.negative?
        error!({ error: 'you have insufficient balance' }, 400)
      end
      if params[:painting].sold_out
        error!({ error: 'this painting has already been sold' }, 400)
      end
      # purchase = me.purchases.create(declared(params, **DECLARED_OPTIONS))
      purchase = me.purchases.create(painting: params[:painting])
      me.update_attribute(:balance, new_balance)
      present(purchase, with: MyPurchaseRepresenter)
    end
  end
end
