Factory.define :project do |p|
  p.name "some project"
end

Factory.define :task do |t|
  t.association :project
  t.name "some taks"
  t.status 1
end
