class Rectangle:
    def __init__(self,width,height):
        self.width = width
        self.height = height

    def set_width(self,num):
        self.width = num
        return self.width
    
    def set_height(self,num): #mudar largura
        self.height = num
        return self.height

    def get_area(self):
        return self.width * self.height
    
    def get_perimeter(self): 
        return 2 * self.width + 2 * self.height
    
    def get_diagonal(self): #hypotenusa
        return (self.width ** 2 + self.height ** 2) ** .5
    
    def get_picture(self):
        return f'{self.width * '*'} \n' * self.height
    
    def get_amount_inside(self,obj):
        return obj
    
    def __str__(self):
        if self.height % 2 == 0:
            x = f'Square(side={self.height})'
        else:
            x = f'Rectangle(width={self.width},height={self.height})'
        return x
    
class Square(Rectangle):
    def __init__(self,side):
        super().__init__(side, side)

    def set_side(self,side):
        self.width = side
        self.height = side
        return side

if __name__ == '__main__':
    rect = Rectangle(10, 5)
    print(rect.get_area())
    rect.set_height(3)
    print(rect.get_perimeter())
    print(rect)
    print(rect.get_picture())

    sq = Square(9)
    print(sq.get_area())
    sq.set_side(4)
    print(sq.get_diagonal())
    print(sq)
    print(sq.get_picture())

    rect.set_height(8)
    rect.set_width(16)
    print(rect.get_amount_inside(sq))