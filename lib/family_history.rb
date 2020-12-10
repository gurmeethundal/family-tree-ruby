class FamilyHistory
  def self.record
    {
      0 => {member: 'King Arthur', spouse: 'Queen Margret', member_gender: 'male'},
      1 => {
        'Queen Margret' => [
          {member: 'Bill', spouse: 'Flora', member_gender: 'male'},
          {member: 'Charlie', member_gender: 'male'},
          {member: 'Percey', spouse: 'Audrey', member_gender: 'male'},
          {member: 'Ronald', spouse: 'Helen', member_gender: 'male'},
          {member: 'Ginerva', spouse: 'Harry', member_gender: 'female'}
        ]
      },
      2 => {
        'Flora' => [
          {member: 'Victoire', spouse: 'Ted', member_gender: 'female'},
          {member: 'Dominique', member_gender: 'female'},
          {member: 'Louis', member_gender: 'male'}
        ],
        'Audrey' => [
          {member: 'Moly', member_gender: 'female'},
          {member: 'Lucy', member_gender: 'female'}
        ],
        'Helen' => [
          {member: 'Rose', spouse: 'Malfoy', member_gender: 'female'},
          {member: 'Hugo', member_gender: 'male'}
        ],
        'Ginerva' => [
          {member: 'James', spouse: 'Darcy', member_gender: 'male'},
          {member: 'Albus', spouse: 'Alice', member_gender: 'male'},
          {member: 'Lily', member_gender: 'female'}
        ]
      },
      3 => {
        'Victoire' => [
          {member: 'Remus', member_gender: 'male'}
        ],
        'Rose' => [
          {member: 'Draco', member_gender: 'male'},
          {member: 'Aster', member_gender: 'female'}
        ],
        'Darcy' => [
          {member: 'William', member_gender: 'male'}
        ],
        'Alice' => [
          {member: 'Ron', member_gender: 'male'},
          {member: 'Ginny', member_gender: 'female'}
        ]
      }
    }
  end
end