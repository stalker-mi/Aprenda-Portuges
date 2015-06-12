package utils 
{
		import feathers.display.Scale9Image;
	import feathers.textures.Scale9Textures;
	import feathers.controls.LayoutGroup;
	import feathers.dragDrop.DragData;
	import feathers.dragDrop.DragDropManager;
	import feathers.dragDrop.IDropTarget;
	import feathers.events.DragDropEvent;

	import starling.display.DisplayObject;
		import starling.text.TextField;
	
	import flash.geom.Rectangle;

	/**
	 * ...
	 * @author Vovik
	 */
	public class dropTarget extends LayoutGroup implements IDropTarget
	{
		private var dragFormat:String;
		private var myY:int;
		private var str:String;
		private var group:LayoutGroup ;
		
		public function dropTarget(dragFormat:String,y:int,str:String) 
		{
			this.dragFormat = dragFormat;
			myY = y;
			this.str = str;
			addEventListener(DragDropEvent.DRAG_ENTER, dragEnterHandler);
			addEventListener(DragDropEvent.DRAG_EXIT, dragExitHandler);
			addEventListener(DragDropEvent.DRAG_DROP, dragDropHandler);
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
			group.x = 70+350;
			group.y = 50 * (myY + 1) + 15;
			addChild(group);
			
		}
		
		private function dragEnterHandler(event:DragDropEvent, dragData:DragData):void
		{
			if(!dragData.hasDataForFormat(dragFormat))
			{
				return;
			}
			DragDropManager.acceptDrag(this);
			group.alpha = 0.8;
		}

		private function dragExitHandler(event:DragDropEvent, dragData:DragData):void
		{
			group.alpha = 1;
		}

		private function dragDropHandler(event:DragDropEvent, dragData:DragData):void
		{
			/*
			var droppedObject:DisplayObject = DisplayObject(dragData.getDataForFormat(dragFormat))
			droppedObject.x = Math.min(Math.max(event.localX - droppedObject.width / 2,
				0), this.actualWidth - droppedObject.width); //keep within the bounds of the target
			droppedObject.y = Math.min(Math.max(event.localY - droppedObject.height / 2,
				0), this.actualHeight - droppedObject.height); //keep within the bounds of the target
			//addChild(droppedObject);
			*/
			var group2:LayoutGroup = dragData.getDataForFormat(dragFormat);
			var t:TextField = group2.getChildAt(1) as TextField;
			if (t.text == str) {
				removeChild(group);
			}
			else {
				var p:dragSource = parent.getChildByName(group2.name) as dragSource;
				p.dragCompleteHandler(new DragDropEvent(DragDropEvent.DRAG_COMPLETE,dragData,false),null);
			}
			group.alpha = 1;
		}
	}

}