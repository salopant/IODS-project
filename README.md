README
================
salopant
2 November 2018

This course, Introduction to Open Data Science, will teach me how to
utilize the open data in data science projects. I will learn how to
scrap, wrangle and analyse the data and how to collaborate with other
people using tools such as Github and R studio.

My course diary can be found at
<https://salopant.github.io/IODS-project/>

## Project: Student performance analysis based on MOOC data

### Data Source: antti.salopuro@suomi24.fi

### Tasks (22/11 - 29/11)

#### Transforming Log Data: Tri
Get more variables from the time data
```json
{
    "time_spent_for_a_topic": {
        "description": "delta(start_time_next_topic - start_time_this_topic)",
        "type": "integer = difference of date",
        "reason": "investigating how much time a student spent to meet the minimum requirement and is allowed to move to next topic"
    },
    "time_spent_improving_on_a_topic": {
        "description": "delta(last_event_of_topic - time_meeting_minimum_requirement)",
        "type": "integer = difference",
        "reason": "investigating the time student spent improving on his performance even after meeting min requirement"
    },
    "count_events_for_a_topics": {
        "description": "number of events a student working on this topic",
        "type": "integer - count",
        "reason": "how active the student is in a topic",
        "note": "an event can create multiple events"
    },
    "n_individual_days": {
        "description": "number of unique date labels",
        "type": "integer- count",
        "reason": "describe behavior "
    }
}
```

#### Finding patterns of behavior

* Methods for finding patterns: Antti, Zafar
    * Based on transformed log data and GradeBook
    * Possbily implement something 
    * TODO(FUTURE): Choosing which columns to use in GradeBook data

