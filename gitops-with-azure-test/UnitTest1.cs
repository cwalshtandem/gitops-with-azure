using System;
using Xunit;

namespace gitops_with_azure_test
{
	public class UnitTest1
	{
		[Fact]
		public void superWeakTest()
		{
			var foobool = true;

			Assert.True(foobool);
		}
	}
}
