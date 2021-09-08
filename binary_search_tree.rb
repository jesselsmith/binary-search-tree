class BST include Enumerable
    attr_accessor :data, :left, :right
    def initialize(data, root = nil, left = nil, right = nil)
        @data = data
        @left = left
        @right = right
        @root = root.nil? ? self : root
    end
    
    def insert(number)
        if number <= @data
            @left.nil? ? @left = BST.new(number, @root) : @left.insert(number)
        else
            @right.nil? ? @right = BST.new(number, @root) : @right.insert(number)
        end
    end
    
    def in_order(node=@root, &block)
        return if node.nil?
        in_order(node.left, &block)
        yield node.data
        in_order(node.right, &block)
    end

    def each(&block)
        in_order(&block)
    end

    def <=>(other)
        @data <=> other.data
    end
end