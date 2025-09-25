"""Mood Journal Step 6 (AI-enhanced, simplified abilities)"""

import from byllm.llm { Model }
glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

def reflect(mood: str, reason: str, intensity: int) -> str by llm();
def get_advice(mood: str, reason: str, intensity: int) -> str;

walker JournalBot {
    has mood: str = "";
    has reason: str = "";
    has intensity: int = 0;

    can add_entry with `root entry;
    can add_entry with MoodEntry entry;
}

node MoodEntry {
    has mood: str;
    has reason: str;
    has intensity: int;
    has advice: str = "";
}

with entry {
    mood = input("How are you feeling today? ");
    reason = input("Why do you feel this way? ");
    txt = input("On a scale 1-10, how strong is this feeling? ");
    intensity = int(txt);

    root spawn JournalBot(mood=mood, reason=reason, intensity=intensity);
}
