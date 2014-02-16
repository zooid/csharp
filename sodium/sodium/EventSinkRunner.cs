namespace sodium
{
    public class EventSinkRunner<TEvent> : IHandler<Transaction>
    {
        private readonly TEvent _event;
        private readonly EventSink<TEvent> _sink;

        public EventSinkRunner(EventSink<TEvent> sink, TEvent evt)
        {
            _sink = sink;
            _event = evt;
        }

        public void Run(Transaction transaction)
        {
            _sink.Send(transaction, _event);
        }
    }
}