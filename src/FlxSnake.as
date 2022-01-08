/**
 * 
 * Cursor keys to move. Red squares are fruit. Snake can wrap around screen edges.
 * 
 * @author Richard Davey, Photon Storm <rich@photonstorm.com>
 * modyfied by Fuad Prince <fuad-prince@hotmail.com>
 * Flixel 2.53
 */

package  
{
	import org.flixel.*;
	import flash.utils.getTimer;
	
	public class FlxSnake extends FlxState
	{
		[Embed(source = "org/flixel/data/beep.mp3")] protected var SndBeep:Class;
		
		private var snakeHead:FlxSprite;
		private var snakeBody:FlxGroup;
		private var fruit:FlxSprite;
		
		private var nextMove:int;
		private var snakeSpeed:int;
		private var addSegment:Boolean;
		
		private var txt:FlxArText;
		private var score:int;
		
		private var Alive:Boolean;
		
		public function FlxSnake() 
		{
		}
		
		override public function create():void
		{
			snakeSpeed = 150;
			addSegment = false;
			nextMove = getTimer() + snakeSpeed * 2;
			Alive = true;
			
			snakeBody = new FlxGroup();
			
			MakeNewBody(64 + 8, FlxG.height / 2);
			snakeHead = snakeBody.members[0];
			snakeHead.makeGraphic(8, 8, 0xFFFFAA00); // تغيير لون الرأس قليلاً عن باقي الأجزاء
			snakeHead.facing = FlxObject.LEFT;
			
			MakeNewBody(64 + 16, FlxG.height / 2);
			MakeNewBody(64 + 24, FlxG.height / 2);
			MakeNewBody(64 + 32, FlxG.height / 2);
			
		//	Something to eat
			fruit = new FlxSprite(0, 0).makeGraphic(8, 8, 0xFF00FFFF);
			placeFruit();
			
			
			score = 0;
			txt = new FlxArText(100, 2, 200);
			
			add(snakeBody);
			add(fruit);
			add(txt);
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.overlap(snakeHead, snakeBody, KillSneak);
			
			if (Alive)
			{
			//	1) First did we hit the fruit?
				if (snakeHead.overlaps(fruit))
				{
					score += 10;
					placeFruit();
					addSegment = true;
					FlxG.play(SndBeep);
					
					//	Get a little faster each time
					if (snakeSpeed > 50)
					{
						snakeSpeed -= 10;
					}
				}
			
			//Keys Input Handling
			if (FlxG.keys.UP)
			{
				snakeHead.facing = FlxObject.UP;
			}
			else if (FlxG.keys.DOWN)
			{
				snakeHead.facing = FlxObject.DOWN;
			}
			else if (FlxG.keys.LEFT)
			{
				snakeHead.facing = FlxObject.LEFT;
			}
			else if (FlxG.keys.RIGHT)
			{
				snakeHead.facing = FlxObject.RIGHT;
			}
			//End Keys Input Handling
			
			if (getTimer() > nextMove)
			{
			 moveSneak();
			 txt.text = "النتيجة: " + score + " السرعة: " + (160 - snakeSpeed);
			 nextMove = getTimer() + snakeSpeed;
			}
			}
			else
			   txt.text = "إنتهت اللعبة! والنتيجة: " + score;
			

		}
		
		private function KillSneak(object1:FlxObject, object2:FlxObject):void
		{
			Alive = false;
		}

		private function moveSneak():void 
		{
			var oldX:int = snakeHead.x;
			var oldY:int = snakeHead.y;
			
			if (addSegment)
			{
				var addX:int = snakeBody.members[snakeBody.countLiving() - 1].x;
				var addY:int = snakeBody.members[snakeBody.countLiving() - 1].y;
			}
			
			switch (snakeHead.facing)
			{
				case FlxObject.LEFT:
					if (snakeHead.x == 0)
					{
						snakeHead.x = FlxG.width - 8;
					}
					else
					{
						snakeHead.x -= 8;
					}
					break;
					
				case FlxObject.RIGHT:
					if (snakeHead.x == FlxG.width - 8)
					{
						snakeHead.x = 0;
					}
					else
					{
						snakeHead.x += 8;
					}
					break;
					
				case FlxObject.UP:
					if (snakeHead.y == 0)
					{
						snakeHead.y = FlxG.height - 8;
					}
					else
					{
						snakeHead.y -= 8;
					}
					break;
					
				case FlxObject.DOWN:
					if (snakeHead.y == FlxG.height - 8)
					{
						snakeHead.y = 0;
					}
					else
					{
						snakeHead.y += 8;
					}
					break;
			}
			
			for (var s:int = snakeBody.countLiving() - 1; s > 0; s--)
			{
				//	We need to keep the x/y/facing values from the snake part, to pass onto the next one in the chain
				if (s == 1)
				{
					snakeBody.members[s].x = oldX;
					snakeBody.members[s].y = oldY;
				}
				else
				{
					snakeBody.members[s].x = snakeBody.members[s - 1].x;
					snakeBody.members[s].y = snakeBody.members[s - 1].y;
				}
			}
			
			//	Are we adding a new snake segment? If so then put it where the final piece used to be
			if (addSegment)
			{
				MakeNewBody(addX, addY);
				addSegment = false;
			}
		}
		
		private function MakeNewBody(_x:int, _y:int):void
		{
			var newBod:FlxSprite = new FlxSprite(_x, _y).makeGraphic(8, 8, 0xFFFFFF00);
			snakeBody.add(newBod);
		}
		
		private function placeFruit(object1:FlxObject = null, object2:FlxObject = null):void
		{
			//	Pick a random place to put the fruit down
			
			fruit.x = int(Math.random() * (FlxG.width / 8) - 1) * 8;
			fruit.y = int(Math.random() * (FlxG.height / 8) - 1) * 8;
			
			//	Check that the coordinates we picked aren't already covering the snake, if they are then run this function again
			FlxG.overlap(fruit, snakeBody, placeFruit);
		}
		
	}

}