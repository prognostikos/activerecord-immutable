require 'test_helper'

class ActiveRecord::ImmutableTest < MiniTest::Unit::TestCase
  def test_models_can_be_persisted
    assert DomainEvent.create
  end

  def unmodified_models_can_be_saved
    event = DomainEvent.create

    assert event.save

    assert event.save!
  end

  def test_saving_a_persisted_model_with_changes_raises_error
    event = DomainEvent.create
    event.created_at = Time.now - 10

    assert_raises(ActiveRecord::ReadOnlyRecord) do
      event.save
    end

    assert_raises(ActiveRecord::ReadOnlyRecord) do
      event.save!
    end
  end

  def test_updating_a_persisted_model_raises_error
    event = DomainEvent.create

    assert_raises(ActiveRecord::ReadOnlyRecord) do
      event.update_attribute(:created_at, Time.now)
    end

    assert_raises(ActiveRecord::ReadOnlyRecord) do
      event.update_attributes(created_at: Time.now, updated_at: Time.now)
    end
  end

  def test_touching_a_persisted_model_raises_error
    event = DomainEvent.create

    assert_raises(ActiveRecord::ReadOnlyRecord) do
      event.touch
    end
  end

  def test_destroying_a_persisted_model_raises_error
    event = DomainEvent.create

    assert_raises(ActiveRecord::ReadOnlyRecord) do
      event.destroy
    end

    if event.respond_to?(:destroy!)
      assert_raises(ActiveRecord::ReadOnlyRecord) do
        event.destroy!
      end
    end
  end

  def test_delete_raises_error
    event = DomainEvent.create

    assert_raises(ActiveRecord::ReadOnlyRecord) do
      event.delete
    end
  end

  def test_delete_all_raises_error
    assert_raises(ActiveRecord::ReadOnlyRecord) do
      DomainEvent.delete_all
    end
  end

  def test_update_all_raises_error
    assert_raises(ActiveRecord::ReadOnlyRecord) do
      DomainEvent.update_all(created_at: Time.now)
    end
  end

end
