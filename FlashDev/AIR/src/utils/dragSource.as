package utils 
{
	
	import feathers.display.Scale9Image;
	import feathers.textures.Scale9Textures;
	import feathers.controls.LayoutGroup;
	import feathers.dragDrop.DragData;
	import feathers.dragDrop.DragDropManager;
	import feathers.dragDrop.IDragSource;
	import feathers.events.DragDropEvent;
	import starling.display.Sprite;
	
	import flash.geom.Point;
	import starling.events.EnterFrameEvent;
	
	import starling.text.TextField;
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Vovik
	 */
	public class dragSource extends LayoutGroup implements IDragSource
	{
		private var touchID:int = -1;
		private var draggedObject:DisplayObject;
		private var dragFormat:String;
		private var myX:int;
		private var myY:int;
		private var str:String;
		private var group:LayoutGroup ;
				
		public function dragSource(dragFormat:String,y:int,str:String)
		{
			this.dragFormat = dragFormat;
			myY = y;
			this.str = str;
			//addEventListener(TouchEvent.TOUCH, touchHandler);
			//addEventListener(DragDropEvent.DRAG_START, dragStartHandler);
			addEventListener(DragDropEvent.DRAG_COMPLETE, dragCompleteHandler);
			//addEventListener(DragDropEvent.DRAG_DROP, dragDropHandler);
		}
		
		override protected function initialize():void
		{
			
			group = new LayoutGroup();
			var label:TextField = new TextField(300, 50, str, "Segoe Print", 20);
			label.autoSize = "horizontal";
			group.addChild(label);
			var textures:Scale9Textures = new Scale9Textures(Root.assets.getTexture("scale9"), new Rectangle(20, 20, 20, 20));
			var image:Scale9Image= new Scale9Image(textures);
			image.width = label.textBounds.width+8;
			image.height = label.textBounds.height;
			image.x = label.x+label.textBounds.x-4;
			image.y = label.y + label.textBounds.y;
			group.addChildAt(image, 0);
			group.x = 70;
			group.y = 50 * (myY + 1) + 15;
			group.addEventListener(TouchEvent.TOUCH, touchHandler);
			this.name = "l" + myY.toString();
			group.name = "l" + myY.toString();
			addChild(group);
			
		}
		private function touchHandler(event:TouchEvent):void
		{
			if(DragDropManager.isDragging)
			{
				//one drag at a time, please
				return;
			}
			if(touchID >= 0)
			{
				var touch:Touch = event.getTouch(draggedObject, null, touchID);
				if(touch.phase == TouchPhase.MOVED)
				{
					touchID = -1;
					var dragData:DragData = new DragData();
					dragData.setDataForFormat(dragFormat, draggedObject);
					removeChild(group);
					DragDropManager.startDrag(this, touch, dragData, group, -group.width / 2, -group.height / 2);
				}
				else if(touch.phase == TouchPhase.ENDED)
				{
					touchID = -1;
				}
			}
			else
			{
			touch = event.getTouch(this, TouchPhase.BEGAN);
			if (!touch || touch.target == this) return;
			touchID = touch.id;
			//draggedObject = touch.target;
			draggedObject = group;
			}
			
		}
		
		/*
		private function dragStartHandler(event:DragDropEvent, dragData:DragData):void
		{
			//addEventListener(EnterFrameEvent.ENTER_FRAME, enterFrame);
		}
		
		private function dragDropHandler(event:DragDropEvent, dragData:DragData):void
		{
			trace(group.x,group.y);
		}
		
		
		private function enterFrame(event:EnterFrameEvent):void {
			trace(group.x,group.y);
			trace(group.hitTest(new Point(0,0)));
		}
		*/
		public function dragCompleteHandler(event:DragDropEvent, dragData:DragData):void
		{
			if(event.isDropped)
			{
				//the object was dropped somewhere
			}
			else
			{
				//removeEventListener(EnterFrameEvent.ENTER_FRAME, enterFrame);
				group.x = 70+350*myX;
				group.y = 50 * (myY + 1) + 15;
				addChild(group);
				//the drag cancelled and the object was not dropped
			}
		}
		
	}

}