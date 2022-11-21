from checks.models import ControlEvent
from checks.servises.count_score_of_control_event import Counter

def get_control_events_data(start_date, finish_date):
    control_events = ControlEvent.objects.filter(date__range=[start_date, finish_date]).order_by('date')

    result = []

    for control_event in control_events:
        
        counter = Counter(control_event.id)
        
        result.append({
            'date': control_event.date,
            'object_name': control_event.object.name,
            'object_location': control_event.object.location,
            'grade': counter.common_grade,
            'score': control_event.score,
            'score_manager': counter.manager_count_score,
            'score_production_manager': counter.production_count_score,
            'is_overdue_food': counter.is_overdue_food,
            'is_poor_qualit': counter.is_poor_quality,
        })

    return result
    