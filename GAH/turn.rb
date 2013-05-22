#!/usr/bin/env ruby

require 'player_info.rb'
require 'cards.rb'

class Game
	attr_accessor :players
	attr_accessor :numPlayers
	attr_accessor :bet
	attr_accessor :field
	attr_accessor :deck

	# Create the game object
	def initialize(players)
		@players = Array.new(players)
		@numPlayers = players.size
	end

	# Add a player to the array
	def add_player(player)
		if numPlayers < 7
			players << player
			numPlayers += 1
		end
	end

	# Remove a player from the array
	def rm_player(player)
		if players.include?(player)
			players.delete(player)
		end
	end

	# Place a higher bet than previous players
	def raise(value)
		if Player.get_money <= value && bet <= Player.get_money
			@bet = value
			return @value
		else
			puts "Money must be greater than raise"
		end
	end

	# Match the bet of a previous player
	def call(value)
		if money >= bet
			return @bet
		else
			puts "Money must be greater than bet"
		end
	end

	def betting_round
		for player in players
			@roundPlayers = Array.new(players)
			print "Enter betting action: "
			turn = gets
			if turn == "raise"
				print "Enter bet raise: "
				value = gets
				raise(value)
			elsif turn == "call"
				call
			elsif turn == "fold"
				@roundPlayers = array.delete(player)
			elsif turn == "check"
				if bet == NULL
					bet = 0
				end
			end
		end
	end

	def play_turn
		@field = Field.new()
		@deck = Deck.new()
		betting_round
	end
end
