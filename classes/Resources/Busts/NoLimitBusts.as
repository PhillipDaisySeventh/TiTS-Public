package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class NoLimitBusts 
	{
		public function get PREVIEW():Class { return Bust_BIANCA; }
		//public function get SIGNATURE():Class { return SigEmbed; }
		
		//[Embed(source = "../../../assets/images/sig/damnit.png", mimeType = "image/png")]
		//public var SigEmbed:Class;
		// Making assumptions here
		
		[Embed(source = "../../../assets/images/npcs/nolimit/HR/bianca.png", mimeType = "image/png")]
		public var Bust_BIANCA:Class;
		[Embed(source = "../../../assets/images/npcs/nolimit/HR/bianca_nude.png", mimeType = "image/png")]
		public var Bust_BIANCA_NUDE:Class;
			
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/nolimit/HR/bianca.png", mimeType = "image/png")]
			public var Bust_BIANCA:Class;
			[Embed(source = "../../../assets/images/npcs/nolimit/HR/bianca_nude.png", mimeType = "image/png")]
			public var Bust_BIANCA_NUDE:Class;
		}
		
	}

}