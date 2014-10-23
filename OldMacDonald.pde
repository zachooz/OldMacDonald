/* @pjs preload="chicken.png; cow.png; pig.png; poop.png; grass.png;*/
import java.util.Arrays;

PImage aCow;
PImage aPig;
PImage aChicken;
PImage aPoop;
PImage grass;
Farm theFarm;
Poop[] poopHolder;
int poopCount;
void setup(){
	size(800,800);
	aCow = loadImage("cow.png");
	aPig = loadImage("pig.png");
	aChicken = loadImage("chicken.png");
	aPoop = loadImage("poop.png");
	grass = loadImage("grass.png");
	theFarm = new Farm();
	poopHolder = new Poop[100];
	poopCount=0;
}

interface Animal {    
	public void makePoop();        
	public void action(); 
}

class Farm {     
	private Animal[] aBunchOfAnimals = new Animal[10];    
	public Farm(){
		//fills animal randomly
		for(int i = 0; i<aBunchOfAnimals.length; i++){
			int num = (int) (Math.random()*3);
			if(num == 0){
				aBunchOfAnimals[i] = new Cow();
			} else if(num==1){
				aBunchOfAnimals[i] = new Pig();
			} else {
				aBunchOfAnimals[i] = new Chicken();
			}
		}
	}
	public void run(){
		for(Poop thePoop: poopHolder){
			if(thePoop!=null){
				image(aPoop,thePoop.x,thePoop.y, thePoop.theWidth, thePoop.theHeight);
			}
		}
		for(Animal animal: aBunchOfAnimals){
			animal.action();
		}
	}
}

class originalAnimal implements Animal{
	protected float x;
	protected float y;
	protected int theWidth;
	protected int theHeight;
	protected int waitTime;
	protected float newX;
	protected float newY;
	protected int theSecond;
	public originalAnimal(){
		x=(int)(Math.random()*300 + 100);
		y=(int)(Math.random()*300 + 100);
	}

	public void action(){
		show();
		int chance = (int)(Math.random()*2);
		if(x==newX && y==newY && waitTime<=0){
			if(chance == 0){
				waitTime = (int)(Math.random()*5+3);
				theSecond = second();
				makePoop();
			} else {
				newX = (int)(Math.random()*600+100);
				newY = (int)(Math.random()*600+100);
			}
		} else if(x!=newX || y!=newY){
			if(x<newX){
				x++;
			}
			if(x>newX){
				x--;
			}
			if(y<newY){
				y++;
			}
			if(y>newY){
				y--;
			}
		} else if(theSecond != second()){
			waitTime--;
			theSecond=second();
		}
	}
	public void makePoop(){
		if(poopCount>=poopHolder.length-1){
			poopCount = 0;
		}
		poopHolder[poopCount] = new Poop(this.x, this.y);
		poopCount++;
	}
	protected void show(){
		System.out.println("Holder!");
	}
}

class Cow extends originalAnimal{
	public Cow(){
		x=(int)(Math.random()*600 + 100);
		y=(int)(Math.random()*600 + 100);
		theWidth = 100;
		theHeight = 120;
		newX = (int)(Math.random()*600+100);
		newY = (int)(Math.random()*600+100);
	}
	protected void show(){
		image(aCow,x,y, theWidth, theHeight);
	}

}

class Pig extends originalAnimal{
	public Pig(){
		x=(int)(Math.random()*600 + 100);
		y=(int)(Math.random()*600 + 100);
		newX = (int)(Math.random()*600+100);
		newY = (int)(Math.random()*600+100);
		theWidth = 100;
		theHeight = 120;
	}
	protected void show(){
		image(aPig,x,y, theWidth, theHeight);
	}
}

class Chicken extends originalAnimal{
	public Chicken(){
		x=(int)(Math.random()*600 + 100);
		y=(int)(Math.random()*600 + 100);
		newX = (int)(Math.random()*600+100);
		newY = (int)(Math.random()*600+100);
		theWidth = 100;
		theHeight = 120;
	}
	protected void show(){
		image(aChicken,x,y, theWidth, theHeight);
	}
}

class Poop{
	private float x;
	private float y;
	private int theWidth;
	private int theHeight;
	public Poop(float x, float y){
		this.x=x;
		this.y=y;
		theWidth = 50;
		theHeight = 60;
	}
}
void draw(){
	background(#00cc00);
	imageMode(CORNER);
	image(grass, 0, 0, 1024, 1024);
	imageMode(CENTER);
	theFarm.run();
}
