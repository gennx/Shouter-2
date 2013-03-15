module ShoutsHelper
  def shout_formatted_date shout
    shout.created_at.to_s(:long)
  end
end
