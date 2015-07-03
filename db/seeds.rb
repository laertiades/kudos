def populate_weeks_merits(organization, weeks_prior=0)

  organization.users.each do |meritor|

    #each user gives random number of kudos for given week 3 or less
    rand_amount = Random.rand(4)
    if rand_amount > 0

      #chose the given number of kudos recipients at random
      meritees = organization.users.limit(rand_amount).order("RANDOM()")

      #for each one give them kudos along with a random message
      meritees.each do |meritee|
        unless meritor.id == meritee.id
          merit = meritor.given_merits.create(meritee_id: meritee.id, message: "#{meritee.name} is great with the #{Faker::Company.catch_phrase} and can #{Faker::Company.bs}")
          
          # simulate an earlier creation date if necessary
          if weeks_prior > 0
            merit.update(updated_at: weeks_prior.weeks.ago, created_at: weeks_prior.weeks.ago)
          end
        end
      end
    end
  end
end


organizations = Organization.create([{ name: Faker::Company.name }, { name: Faker::Company.name}])

organizations.each do |org|
  userCount = 3 + Random.rand(5)
  for i in 0..userCount
    org.users.create( name: Faker::Name.name, email: Faker::Internet.email, password: "password" )
  end

  populate_weeks_merits(org, 2)
  populate_weeks_merits(org, 1)
  populate_weeks_merits(org)
end
