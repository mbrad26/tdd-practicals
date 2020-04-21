# This file is perfectly fine as it is — don't change
# anything here (unless you're trying to break it to
# see if your tests work)
#
# Also don't add any other files.

class SecretDiary
  def initialize(diary)
    @diary = diary
    @unlocked = false
  end

  def unlock
    @unlocked = true
  end

  def lock
    @unlocked = false
  end

  def read
    return "Go away!" unless @unlocked
    @diary.read
  end

  def write(new_message)
    return "Go away!" unless @unlocked
    @diary.write(new_message)
    nil
  end
end
