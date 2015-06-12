package
{
    public class EmbeddedAssets
    {
        public static const STAGE_WIDTH:int  = 800;
        public static const STAGE_HEIGHT:int = 480;
        
        // Texture Atlas
        [Embed(source="../assets/atlas.xml", mimeType="application/octet-stream")]
        public static const atlas_xml:Class;
        
        [Embed(source="../assets/atlas.png")]
        public static const atlas:Class;
        // Bitmap textures
		
        [Embed(source="../assets/background.png")]
        public static const background:Class;
            
        // Sounds
        
        [Embed(source="../assets/click.mp3")]
        public static const click:Class;
		

    }
}