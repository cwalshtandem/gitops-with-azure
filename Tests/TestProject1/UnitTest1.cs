using System;
using Xunit;

namespace TestProject1
{
	public class UnitTest1
	{
		[Fact]
		public void WowzersWhatACoolTest()
		{
			var fooboolean = true;

			Assert.True(fooboolean);
		}
	}
}
