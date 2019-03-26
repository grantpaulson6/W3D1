# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.
# In which years was the Physics prize awarded, but no Chemistry prize?

# SELECT DISTINCT physics.yr, physics.winner, chem.winner
#     FROM nobels physics
#     FULL OUTER JOIN nobels chem ON physics.yr = chem.yr
#     WHERE physics.subject = 'Physics' AND chem.subject = 'Chemistry'
#     ORDER BY yr ASC

def physics_no_chemistry
  
  execute(<<-SQL)
    SELECT DISTINCT yr
    FROM nobels
    WHERE subject = 'Physics' AND yr NOT IN(
    SELECT yr
    FROM nobels
    WHERE subject = 'Chemistry')
  SQL
end
