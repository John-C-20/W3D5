class PolyTreeNode
    attr_reader :parent, :children, :value
    
    def initialize(value)
        @value = value
        @parent = nil 
        @children = []
    end

    def parent=(node)
        prev_parent = self.parent
        prev_parent.children.delete(self) unless prev_parent.nil?
        @parent = node
        unless node.nil?
            node.children << self unless node.children.include?(self)
        end
    end

    def add_child(child_node) 
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "node is not a child" if child_node.parent.nil?
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value

        return nil if self.nil?

        self.children.each do |child_node|
            next_iteration = child_node.dfs(target_value)
            return next_iteration unless next_iteration.nil?
        end

        return nil
    end

    def bfs(target_value)
        queue = [self]
        child_nodes = []

        until queue.empty?
            until queue.empty? 
                current_node = queue.shift 
                if current_node.value == target_value
                    return current_node
                else
                    child_nodes += current_node.children
                end
            end

            queue = child_nodes 
            child_nodes = [] 
        end

        return nil
    end
end



