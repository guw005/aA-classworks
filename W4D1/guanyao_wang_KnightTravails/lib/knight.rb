require_relative '00_tree_node'

class KnightPathFinder

    attr_reader :move_tree

    def self.valid_moves(pos_obj)
        valid_pos = []
        (-2..2).each do |x_inc|
            (-2..2).each do |y_inc|
                if x_inc != 0 && y_inc != 0 && x_inc.abs != y_inc.abs
                    final_x = pos_obj.value.first + x_inc
                    final_y = pos_obj.value.last + y_inc
                    if final_x.between?(0,7) && final_y.between?(0,7)
                        valid_pos << [final_x,final_y]
                    end
                end
            end
        end
        valid_pos
    end

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        @move_tree = build_move_tree(start_pos)
    end

    def build_move_tree(start_pos)
        # @root_node = PolyTreeNode.new(start_pos)
        queue = [@root_node]
        move_tree = []
        until queue.empty?
            node = queue.shift
            move_tree << node
            new_move_positions(node).each do |pos_arr|
                new_node = PolyTreeNode.new(pos_arr)
                new_node.parent=(node)
                queue << new_node
                # queue << PolyTreeNode.new(pos_arr)
            end
        end
        move_tree
    end

    def new_move_positions(pos_obj)
        new_valid_positions = KnightPathFinder.valid_moves(pos_obj)
        @considered_positions.each do |position|
            new_valid_positions.delete(position)
        end
        @considered_positions += new_valid_positions
        new_valid_positions
    end

    def find_path(end_pos_arr)
        end_node = @root_node.dfs(end_pos_arr)
        return nil if end_node.nil?
        trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        path = []
        queue = [end_node]
        until queue.empty?
            current_node = queue.shift
            path.unshift(current_node.value)
            return path if current_node.value == @root_node.value
            queue << current_node.parent
        end
    end


end


#   0 1 2 3 4 5 6 7
# 0
# 1
# 2
# 3       X
# 4
# 5
# 6
# 7

# start_pos = 3,3
# valid_moves & inside of [0-7,0-7]
# 1,2   [x-2,x-1]
# 1,4   [x-2,x+1]
# 2,1   [x-1,x-2]
# 2,5   [x-1,x+2]
# 4,1   [x+1,x-2]
# 4,5   [x+1,x+2]
# 5,2   [x+2,x-1]
# 5,4   [x+2,x+1]
