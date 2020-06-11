package classes.Engine.Combat
{
  /**
   * Return a string giving a vague indication of damages.
   * @author Phillip Daisy Seventh
   */
  public function fuzzDamage(damage:Number):String {
    return damage >= 50 ? "++++" :
      damage >= 25 ? "+++" :
      damage >= 10 ? " ++" :
      damage >= 5 ? "+" :
      damage > -5 ? "~" :
      damage > -10 ? "-" :
      damage > -25 ? "--" :
      damage > -50 ? "---" :
      "----";
  }
}