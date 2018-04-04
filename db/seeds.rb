# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Admin', email: 'admin@admin.com', password: 'admin', role: 1)
User.create(name: 'Jimmy', email: 'nelson.jimmy@gmail.com', password: 'test')
User.create(name: 'Sasha', email: 'sasha@gmail.com', password: 'test')
User.create(name: 'Seth', email: 'seth@gmail.com', password: 'test')
User.create(name: 'Ethel', email: 'ethel@gmail.com', password: 'test')
User.create(name: 'Ahighat', email: 'ahighat@gmail.com', password: 'test')
User.create(name: 'Bob', email: 'bob@gmail.com', password: 'test')

Reward.create(title: 'Thing1', description: 'Description1', cost: 50)
Reward.create(title: 'Thing2', description: 'Description2', cost: 50)
Reward.create(title: 'Thing3', description: 'Description3', cost: 50)
Reward.create(title: 'Thing4', description: 'Description4', cost: 50)
Reward.create(title: 'Thing5', description: 'Description5', cost: 50)
Reward.create(title: 'Thing6', description: 'Description6', cost: 50)
Reward.create(title: 'Thing7', description: 'Description7', cost: 50)
