/* @pjs preload="chicken.png; cow.png; pig.png; poop.png; grass.png;*/
PImage cow;
PImage pig;
PImage chicken;
PImage poop;
PImage grass;
void setup(){
	size(800,800);
	cow = loadImage("cow.png");
	pig = loadImage("pig.png");
	chicken = loadImage("chicken.png");
	poop = loadImage("poop.png");
	grass = loadImage("grass.png");
}

interface Animal {    
	public void makePoop();        
	public void walk(); 
}

class Farm {     
	private Animal[] aBunchOfAnimals = new Animal[10];    
	public Farm(){
		//fills animal randomly
		for(Animal animal : aBunchOfAnimals){
			int num = (int) (Math.random()*3);
			if(num == 0){
				animal = new Cow();
			} else if(num==1){
				animal = new Pig();
			} else {
				animal = new Chicken();
			}
		}
	}
}

class originalAnimal implements Animal{
	private float x;
	private float y;
	private int theWidth;
	private int theHeight;
	private Poop[] poopHolder;
	private int poopCount;
	private int waitTime;
	private float newX;
	private float newY;
	private int theSecond;
	public Animal(){
		x=(int)(Math.random()*300 + 100);
		y=(int)(Math.random()*300 + 100);
		poopHolder = new Poop[8];
		poopCount = 0;
	}

	public void walk(){
		int chance = (int)(Math.random()*2);
		if(chance == 0){
			waitTime = (int)(Math.random()*5+3)
		} else {
		}
	}
	public void makePoop(){

	}	
}

class Cow extends originalAnimal{
	public Cow(){
		x=(int)(Math.random()*300 + 100);
		y=(int)(Math.random()*300 + 100);
		poopHolder = new Poop[8];
		poopCount = 0;
	}

}

class Pig extends originalAnimal{
	public Pig(){
		x=(int)(Math.random()*300 + 100);
		y=(int)(Math.random()*300 + 100);
		poopHolder = new Poop[8];
		poopCount = 0;
	}
}

class Chicken extends originalAnimal{
	public Chicken(){
		x=(int)(Math.random()*300 + 100);
		y=(int)(Math.random()*300 + 100);
		poopHolder = new Poop[8];
		poopCount = 0;
	}
}

class Poop{
	private float x;
	private float y;
	private int theWidth;
	private int theHeight;
	Poop(int x, int y){
		this.x=x;
		this.y=y;
	}
}
void draw(){
	image(grass, 0, 0, 1024, 1024);
}
