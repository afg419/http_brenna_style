# require_relative 'parser'

class Debugger

  def initialize(pars)
    @pars = pars
  end

  def debug_it
    "\r\rverb: #{@pars.set_verb} \npath: #{@pars.set_path}"
  end

end
