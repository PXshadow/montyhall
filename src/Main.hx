class Main {
	static function main() {
		var runs:Int = 1000;
		var change:Bool = true;
		var correct:Int = 0;
		for (i in 0...runs)
		{
			var picked = Std.random(3); //totally random
			var car = Std.random(3); //totally random
			function getMonty():Int
			{
				for (i in 0...3)
				{
					if (i != picked && i != car) return i;
				}
				throw 'get monty error $picked $car';
			}
			var monty = getMonty(); //host makes sure not to pick car
			function getChange():Int
			{
				for (i in 0...3)
				{
					if (i != picked && i != monty) return i;
				}
				throw 'get pick error $picked $monty';
			}
			if (change) picked = getChange();
			if (picked == car)
			{
				//player picked correct
				correct++;
			}
		}
		trace('player switch: $change correct: ${correct/runs}');
	}
}
