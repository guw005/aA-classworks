require 'byebug'
class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent_node_obj)
        @parent.children.delete(self) unless @parent.nil?
        @parent = parent_node_obj
        unless parent_node_obj.nil?
            parent_children_arr = parent_node_obj.children
            parent_children_arr << self unless parent_children_arr.include?(self)
            # parent_node_obj.children << self unless parent_node_obj.children.include?(self)
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if @children.include?(child_node)
            child_node.parent = nil
        else
            raise "invalid child"
        end
    end

    def dfs(target_value)
        return self if value == target_value
        children.each do |child|
            search_result = child.dfs(target_value)
            return search_result unless search_result.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            ele = queue.shift
            return ele if ele.value == target_value
            ele.children.each {|child| queue << child}
        end
        nil
    end

end
