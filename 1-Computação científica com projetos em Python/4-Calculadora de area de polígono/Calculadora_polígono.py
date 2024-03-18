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
        picture = ""
        if self.width >= 50 or self.height >= 50:
            return 'Too big for picture.'
        else:
            for _ in range(self.height):
                picture += '*' * self.width + '\n'
            return picture
        
    def get_amount_inside(self,obj):
        area_rect = self.get_area()
        area_square = obj.get_area()
        return area_rect // area_square
    
    def __str__(self):
        if self.width == self.height:
            x = f'Square(side={self.height})'
        else:
            x = f'Rectangle(width={self.width}, height={self.height})'
        return x
    
class Square(Rectangle):
    def __init__(self,side):
        super().__init__(side, side)

    def set_side(self,side):
        self.width = side
        self.height = side
        return side

    def set_width(self, side):
        self.width = side
        self.height = side
        return side

    def set_height(self, side):
        self.width = side
        self.height = side
        return side
    
if __name__ == '__main__':
    rect = Rectangle(10, 5)
    print(rect.get_area())
    rect.set_height(3)
    rect.set_width(7)
    print(rect)