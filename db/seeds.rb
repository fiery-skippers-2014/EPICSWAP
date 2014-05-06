require_relative 'preliminary_seeds'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  categories = Category.create([ {name: 'language' }, { name: 'sport' }, {name: 'finance'}, {name: 'arts'}, {name: 'fitness'}, {name: 'technology'} ])
  # language = 1
  # sport = 2
  # finance = 3
  # arts = 4
  # fitness = 5
  # technology = 6
  language   = ["german", 'japanese', "mandarin", 'chinese', 'sanskrit', 'spanish', 'portuguese', 'arabic', 'french', 'english', 'writing', 'short stories', 'poems', 'haiku']
  sport      = ['trap shooting', 'hiking', 'football', 'basketball', 'baseball', 'hockey', 'soccer', 'kayaking', 'rock climbing', 'white water rafting', 'skydiving', 'fencing', 'skiing', 'wakeboarding', 'snowboarding', 'motocross', 'bmx', 'biking', 'downhill racing', 'mountain biking', 'cross country', 'running', 'cross country skiing', 'back country skiing', 'heli-skiing', 'water skiing', 'auto cross', 'skateboarding', 'long jump', 'long boarding', 'surfing', 'wake skating', 'high jump', 'boogie boarding', 'sea kayaking', 'white water kayaking', 'stand-up paddleboarding']
  finance    = ["accounting", "running a small buisness", "investing", "trading stocks", "mutual funds", "turbo tax", "forex", "quickbooks", "taxes", "starting a buisness"]
  art        = ["painting", "pottery", "sculpture", "making pots", "guitar", "tuba", "trumpet", "piano", "clarinet", "flute", "banjo", "harmonica", "ukulele", "bass", "drums", "salsa", "tango", "ballroom", "bachata", "fox trot"]
  fitness    = ["getting swole", "kettle bells", "lifting weights", "crossfit", "sprint training", "plyometrics", "yoga", "pilates", "massages", "weight loss", "nutrition", "weight gain", "power lifting", "physical therapy", "injury prevention", "long distance running", "marathon training", "half marathon training"]
  technology = ["programing", "ruby", "ruby on rails", "node", "js node", "firebase", "mongo db", "database design", "javascript", "backend web development", "front end web development", "graphic design", "css", "html", "jquery", "ios", "andriod", "responsive design", "mobile design", "integrated technologies", "gmail", "photoshop", "illustrator", "adobe creative suite", "sketchup", "wordpress", "drupal", "wix", "search engine optimization", "seo", "flying planes", "building apps"]

  language.each do |skill|
  	Skill.create(name: skill, category_id: 1)
  	Interest.create(name: skill)
  end

  sport.each do |skill|
  	Skill.create(name: skill, category_id: 2)
  	Interest.create(name: skill)
  end

  finance.each do |skill|
  	Skill.create(name: skill, category_id: 3)
  	Interest.create(name: skill)
  end

  art.each do |skill|
  	Skill.create(name: skill, category_id: 4)
  	Interest.create(name: skill)
  end

  fitness.each do |skill|
  	Skill.create(name: skill, category_id: 5)
  	Interest.create(name: skill)
  end

  technology.each do |skill|
  	Skill.create(name: skill, category_id: 6)
  	Interest.create(name: skill)
  end

