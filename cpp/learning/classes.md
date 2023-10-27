# Learning  even the smallest details in cpp classes

## making a class

```cpp
class myClass{
    public:
        int myNum;
        string myString;
};
```

## making an object (an instance of a class)

```cpp
myClass myObj;
```

## accessing the class members

```cpp
myObj.myNum = 15;
myObj.myString = "some text";
```

## be noted that a class is very similar to a struct and the only difference is that the members of a class are private by default and the members of a struct are public by default

```cpp
struct myStruct{
    int myNum;
    string myString;
};
```

## making a class with a constructor( a function that is called when an object is created)

```cpp
class myClass{
    public:
        int myNum;
        string myString;
        myClass(int num, string text){
            myNum = num;
            myString = text;
        }
};
```

## making an object with a constructor

```cpp
myClass myObj(15, "some text");
```

## making a class with a constructor and a default constructor

```cpp
class myClass{
    public:
        int myNum;
        string myString;
        myClass(int num, string text){
            myNum = num;
            myString = text;
        }
        myClass(){
            myNum = 0;
            myString = "default";
        }
};
```
the default constructor is called when an object is created without any arguments, but if an object is created with arguments, the constructor with arguments is called

## there is another way to make a constructor to initialize the members of a class

```cpp
class myClass
    {
    public:
        myClass(int num, string text): myNum(num++), myNum2(num++), myString(text) {}
        int myNum2;
        int myNum;
        string myString;
    };
myClass myObj(15, "some text");
```

as you can see, the members are initialized in the constructor, but the thing is, in the constructor, the members are initialized in the order they are declared in the class, not in the order they are declared in the constructor, so in the above example, myNum2 is initialized before myNum, and myNum is initialized before myString

this way of initializing the members is called member initializer list

## making a class with a destructor( a function that is called when an object is destroyed)

```cpp
class myClass{
    public:
        int myNum;
        string myString;
        myClass(int num, string text){
            myNum = num;
            myString = text;
        }
        myClass(){
            myNum = 0;
            myString = "default";
        }
        ~myClass(){
            cout << "object destroyed" << endl;
        }
};
```
destructors are called when an object is destroyed, which happens when the object is out of scope, or when the program ends

you can also destroy an object manually by using the delete keyword

```cpp
delete myObj;
```

## making a class with a copy constructor( a constructor that copies the members of an object to another object)

```cpp
class myClass{
    public:
        int myNum;
        string myString;
        myClass(int num, string text){
            myNum = num;
            myString = text;
        }
        myClass(){
            myNum = 0;
            myString = "default";
        }
        myClass(const myClass &obj){
            myNum = obj.myNum;
            myString = obj.myString;
        }
};
```

