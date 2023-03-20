require 'pry'

nested = [
  { fruit: {
      apple: 1,
      banana: 2,
      grape: 6
    },
    pets: {
      fido: 'dog',
      whiskers: 'cat',
      charles: 'mouse',
      bitey: 'snake'
    },
    teams: {
      new_york: {
        baseball: %w[mets yankees],
        basketball: %w[knicks nets],
        football: %w[giants jets],
        hockey: %w[rangers islanders]
      },
      los_angeles: {
        baseball: %w[dodgers angels],
        basketball: %w[lakers clippers],
        football: %w[rams chargers],
        hockey: ['kings']
      },
      chicago: {
        baseball: ['cubs'],
        basketball: ['bulls'],
        football: ['bears'],
        hockey: ['blackhawks']
      }
    } }
]

def list_basketball_teams_by_city(array)
  array.each do |element|
    element.each do |outer_key, outer_value|
      next unless outer_key == :teams

      outer_value.each do |city, sports_hash|
        sports_hash.each do |sport, team_name_array|
          puts "The basketball teams for #{city} are #{team_name_array}." if sport == :basketball
        end
      end
    end
  end
end
list_basketball_teams_by_city(nested)
