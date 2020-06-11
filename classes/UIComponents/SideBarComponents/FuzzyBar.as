package classes.UIComponents.SideBarComponents
{

  import flash.events.Event;
  import classes.kGAMECLASS;
  import classes.Engine.Utility.MathUtil;

  public class FuzzyBar extends StatBar {

    protected var _cGoal:Number = 0;

    public function FuzzyBar(mode:String) {
      super(mode);
    }

    override public function set value(v:*):void {
      super.value = kGAMECLASS.gameOptions.fuzzyInterface ? "" : v;
    }

    override public function resetBar():void {
      super.resetBar();
      _cGoal = 0;
    }

    override protected function update(e:Event):void {
      if (!kGAMECLASS.gameOptions.fuzzyInterface) {
        super.update(e);
      } else {
        fuzzyUpdate(e);
      }
    }

    private function fuzzyUpdate(e:Event):void {
      if (visible == false) return;

      if (_valueGlow.alpha > 0 && _tickGlow) {
        _valueGlow.alpha -= _glowFrames;
        _values.filters = [_valueGlow]
      }

      var cScale:Number = _cGoal / _tMax;
      var tScale:Number = _tGoal == 0 ? 0 : _tGoal / _tMax;

      if (cScale > tScale) {
        cScale -= _barFrames;
        _cGoal = cScale * _tMax;
        if (cScale < tScale) {
          cScale = tScale;
          _cGoal = _tGoal;
        }
      }
      else if (cScale < tScale) {
        cScale += _barFrames;
        _cGoal = cScale * _tMax;
        if (cScale > tScale) {
          cScale = tScale;
          _cGoal = _tGoal;
        }
      }

      if (_desiredMode != StatBar.MODE_NOBAR) super.value = "";

      if (_desiredMode == StatBar.MODE_BIG) {
        _maskingBar.scaleX = _progressBar.scaleX = isNaN(cScale) ? 0 : 1;
        updateColor(cScale);
      } else if (_desiredMode == StatBar.MODE_SMALL) {
        _maskingBar.scaleX = _progressBar.scaleX = isNaN(cScale) ? 0 : cScale;
      } else if (_desiredMode == StatBar.MODE_NOBAR) {
        var power:int = 0;
        var flooredValue:Number = _cGoal;
        while (flooredValue > 10) {
          flooredValue /= 10;
          power += 1;
        }
        flooredValue = Math.floor(flooredValue) * Math.pow(10, power);

        super.value = flooredValue;
      }
    }
  }
}