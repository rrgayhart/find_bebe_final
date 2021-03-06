require 'test_helper'

class PetTest < ActiveSupport::TestCase

  def test_most_recent_pets_returns_3_pets
    Pet.create(species_cd: 0, status_cd: 0, name: "tigger", description: "big fat cat", zip: 37281, avatar_file_name: "large.jpg")
    Pet.create(species_cd: 1, status_cd: 0, name: "fido", description: "big fat dog", zip: 37281, avatar_file_name: "large.jpg")
    Pet.create(species_cd: 2, status_cd: 0, name: "polly", description: "parrot", zip: 37281, avatar_file_name: "large.jpg")
    Pet.create(species_cd: 1, status_cd: 0, name: "spot", description: "skinny dog", zip: 37281, avatar_file_name: "large.jpg")

    assert_equal 3, Pet.recent_with_image.count
  end

   def test_most_recent_pets_returns_3_most_recent_pets
    p1 = Pet.create(species_cd: 0, status_cd: 0, name: "tigger", description: "big fat cat", zip: 37281, avatar_file_name: "large.jpg")
    p2 = Pet.create(species_cd: 1, status_cd: 0, name: "fido", description: "big fat dog", zip: 37281, avatar_file_name: "large.jpg")
    p3 = Pet.create(species_cd: 2, status_cd: 0, name: "polly", description: "parrot", zip: 37281, avatar_file_name: "large.jpg")
    p4 = Pet.create(species_cd: 1, status_cd: 0, name: "spot", description: "skinny dog", zip: 37281, avatar_file_name: "large.jpg")

    assert Pet.recent_with_image.include?(p2)
    assert Pet.recent_with_image.include?(p3)
    assert Pet.recent_with_image.include?(p4)
  end

  def test_most_recent_pets_does_not_return_pets_besides_last_3
    p1 = Pet.create(species_cd: 0, status_cd: 0, name: "tigger", description: "big fat cat", zip: 37281, avatar_file_name: "large.jpg")
    p2 = Pet.create(species_cd: 1, status_cd: 0, name: "fido", description: "big fat dog", zip: 37281, avatar_file_name: "large.jpg")
    p3 = Pet.create(species_cd: 2, status_cd: 0, name: "polly", description: "parrot", zip: 37281, avatar_file_name: "large.jpg")
    p4 = Pet.create(species_cd: 1, status_cd: 0, name: "spot", description: "skinny dog", zip: 37281, avatar_file_name: "large.jpg")

    refute Pet.recent_with_image.include?(p1)
  end

end
