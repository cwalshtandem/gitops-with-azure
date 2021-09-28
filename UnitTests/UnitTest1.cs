using System;
using Xunit;

namespace UnitTests
{
	public class UnitTest1
	{
		[Fact]
		public void WowzersWhatACoolTest()
		{
			var fooboolean = false;

			Assert.True(fooboolean);
		}
	}
}
