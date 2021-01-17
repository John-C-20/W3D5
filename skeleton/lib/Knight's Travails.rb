require_relative "00_tree_node.rb"

class KnightPathFinder
    def self.root_node(starting_pos)
        PolyTreeNode.new(starting_pos) 
    end

    def initialize(starting_pos)
        @considered_positions = [starting_pos]
        @move_tree = self.build_move_tree(starting_pos)
    end

    def build_move_tree(starting_pos)
        KnightPathFinder.root_node(starting_pos)
    end

    def self.valid_moves(pos)
        valid_moves_arr = [] 
        #returns a 2d array containing 
        #valid position arrays to move to
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        possible_moves = possible_moves.select do |move|
            !@considered_positions.include?(move)
        end
        @considered_positions += possible_moves
        return possible_moves
    end
    
end
