"""Mood Journal Step 6 (impl)"""

impl get_advice(mood: str, reason: str, intensity: int) {
    return reflect(mood=mood, reason=reason, intensity=intensity);
}

impl JournalBot.add_entry with `root entry {
    nodes = root ++> MoodEntry(
        mood=self.mood,
        reason=self.reason,
        intensity=self.intensity
    );
    n = nodes[0];  

    n.advice = get_advice(mood=self.mood, reason=self.reason, intensity=self.intensity);

    print(f"Saved mood: {self.mood} ({self.intensity}/10)");
    print(f"Advice: {n.advice}");

    print("Mood Journal Review");
    visit [-->];  
}

impl JournalBot.add_entry with MoodEntry entry {
    print("----");
    print(f"Mood: {here.mood}");
    print(f"Reason: {here.reason}");
    print(f"Intensity: {here.intensity}/10");
    if here.advice != "" {
        print(f"Advice: {here.advice}");
    }
}
