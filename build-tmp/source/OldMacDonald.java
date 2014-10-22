import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class OldMacDonald extends PApplet {

/* @pjs preload="chicken.png; cow.png; pig.png; poop.png; grass.png;*/
PImage cow;
PImage pig;
PImage chicken;
PImage poop;
PImage grass;
public void setup(){
	size(1000,1000);
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

class Farm  {     
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

class Cow implements Animal{
	private float x;
	private float y;
	private int theWidth;
	private int theHeight;
	private Poop[] poopHolder;
	private int poopCount;
	public Cow(){
		x=(int)(Math.random()*300 + 100);
		y=(int)(Math.random()*300 + 100);
		poopHolder = new Poop[8];
		poopCount = 0;
	}
	public void walk(){

	}
	public void makePoop(){

	}
}

class Pig implements Animal{
	private float x;
	private float y;
	private int theWidth;
	private int theHeight;
	private Poop[] poopHolder;
	private int poopCount;
	public Pig(){
		x=(int)(Math.random()*300 + 100);
		y=(int)(Math.random()*300 + 100);
		poopHolder = new Poop[8];
		poopCount = 0;
	}
	public void walk(){

	}
	public void makePoop(){

	}
}

class Chicken implements Animal{
	private float x;
	private float y;
	private int theWidth;
	private int theHeight;
	private Poop[] poopHolder;
	private int poopCount;
	public Chicken(){
		x=(int)(Math.random()*300 + 100);
		y=(int)(Math.random()*300 + 100);
		poopHolder = new Poop[8];
		poopCount = 0;
	}
	public void walk(){

	}
	public void makePoop(){

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
public void draw(){
	image(grass, 0, 0, 1024, 1024);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "OldMacDonald" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
