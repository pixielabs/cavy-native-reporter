export default function(spec) {
  spec.describe('Test', function() {
    spec.it('works', async function() {
      await spec.exists('HomeScreen');
    });
  });
}
