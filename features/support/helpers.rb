module Helpers

  def wait_until(timeout_sec=ENV['WAIT_TIME'].to_i,delay_sec=0.5, &block)
    WaitUtil.wait_for_condition("waiting for condition", :timeout_sec => timeout_sec, :delay_sec => delay_sec) do
      block.call
    end
  end

end
