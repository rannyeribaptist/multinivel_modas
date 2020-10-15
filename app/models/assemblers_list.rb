class AssemblersList < ApplicationRecord
  serialize :assemblers_list, Array

  def set_assembler
    self.last_assembler_id = self.next_assembler_id
    if (self.assemblers_list.find_index(self.next_assembler_id)) == (self.assemblers_list.length.to_i - 1)
      self.next_assembler_id = self.assemblers_list.first
    else
      self.next_assembler_id = self.assemblers_list[self.assemblers_list.find_index(self.next_assembler_id) + 1]
    end
    self.save

    return self.next_assembler_id
  end
end
